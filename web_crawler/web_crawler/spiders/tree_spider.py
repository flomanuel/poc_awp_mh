import os
from datetime import datetime

import scrapy
from scrapy.spiders import CrawlSpider, Rule


class TreeSpider(CrawlSpider):
    name = 'tree_spider'
    custom_settings = {
        "DEPTH_LIMIT": 0,
        "ROBOTSTXT_OBEY": False,
    }
    filename = f'output-{datetime.now()}.txt'
    # allowed_domains = ['eur-lex.europa.eu']
    start_urls = ['https://eur-lex.europa.eu/homepage.html']
    rules = (
        Rule(callback='parse_item'),
    )

    def __init__(self, *args, **kwargs):
        super(TreeSpider, self).__init__(*args, **kwargs)
        self.urlList = []

    def parse_item(self, response):
        url = response.url
        with open(f'{self.filename}.txt', 'a') as f:
            f.write(f'{url}\n')
            f.flush()
            os.fsync(f.fileno())
        self.urlList.append(url)
        urls = response.css('a::attr(href)').getall()
        for u in urls:
            if 'eur-lex.europa.eu' in u:
                yield scrapy.Request(u, self.parse_item)
