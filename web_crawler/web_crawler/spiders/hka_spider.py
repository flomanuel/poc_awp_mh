#Based on https://medium.com/@nimritakoul01/web-scrapping-using-scrapy-c4413492f025#:~:text=Once%20the%20scrapy%20is%20installed,target%20elements%20and%20extract%20data.
import os
from datetime import datetime

import scrapy
from scrapy.spiders import CrawlSpider, Rule


class HKASpider(CrawlSpider):
    name = 'tree_spider'
    custom_settings = {
        "DEPTH_LIMIT": 0,
        "ROBOTSTXT_OBEY": False,
    }
    current_path = os.path.dirname(os.path.abspath(__file__))
    output_path = os.path.join(current_path, "output")
    filename = f'output-{datetime.now()}.txt'
    file_path = os.path.join(output_path, filename)

    # allowed_domains = ['eur-lex.europa.eu']
    start_urls = ['https://eur-lex.europa.eu/homepage.html']
    rules = (
        Rule(callback='parse_item'),
        # todo https://docs.scrapy.org/en/latest/topics/dynamic-content.html#using-a-headless-browser
    )

    def __init__(self, *args, **kwargs):
        super(HKASpider, self).__init__(*args, **kwargs)
        self.urlList = []

    def parse_item(self, response):
        url = response.url
        title = response.css("title::text").get()
        if False:
            with open(self.file_path, 'a') as f:
                f.write(f'{title}\n')
                f.write(f'{url}\n')
        with open(os.path.join(self.output_path, f"{title.strip()}.html"), 'w') as f2:
            f2.writelines(response.css('body').get())
        self.urlList.append(url)
        urls = response.css('a::attr(href)').getall()
        for u in urls:
            if 'eur-lex.europa.eu' in u:
                yield scrapy.Request(u, self.parse_item)
