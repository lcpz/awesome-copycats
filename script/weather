#!/usr/bin/env python2.7
# coding=utf-8
"""Fetch weather using Yandex XML API."""

__author__ = "Ilia Glazkov"

import argparse
from urllib2 import urlopen
from xml.etree.ElementTree import ElementTree


WEATHER_API_PREFIX = "http://weather.yahooapis.com/forecastrss?u=c&w="
URLOPEN_TIMEOUT = 5

CELSIUS = '°C'
DASH = "—"

CURRENT_DAY = 'Now'


def weather_url_by_id(id):
    return WEATHER_API_PREFIX + str(id)


def fetch_weather_tree(id):
    return ElementTree().parse(
            urlopen(weather_url_by_id(id), timeout=URLOPEN_TIMEOUT))


def format_date_string(day, text, temp, max_temp=None):
    day = day or 'Now'

    if max_temp:
        temp_string = DASH.join((str(temp), str(max_temp)))
    else:
        temp_string = str(temp)

    return '%s: %s, %s%s.' % (day, text, temp_string, CELSIUS)


class WeatherElement(object):
    def __init__(self, element):
        self.element = element

    @property
    def day(self):
        return self.element.get('day') or CURRENT_DAY

    @property
    def text(self):
        return self.element.get('text')

    @property
    def temp(self):
        temp = self.element.get('temp')
        if temp is not None:
            return str(temp)

        low, high = self.element.get('low'), self.element.get('high')
        if low is not None and high is not None:
            return DASH.join((str(low), str(high)))

    def get_format_string(self):
        return '%s: %s, %s%s.' % (self.day, self.text, self.temp, CELSIUS)


def get_weather_string(tree):
    condition = next(el for el in tree.iter()
                     if el.tag.endswith('condition'))
    forecast = [el for el in tree.iter()
                if el.tag.endswith('forecast')]
    forecast.insert(0, condition)

    return '\n'.join((
            WeatherElement(element).get_format_string()
            for element in forecast))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--id', type=int, required=True,
                        help='Yahoo WEOID of the city')
    args = parser.parse_args()
    print get_weather_string(fetch_weather_tree(args.id))

if __name__ == "__main__":
    main()
