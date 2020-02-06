#!/usr/bin/python3
"""Find the number of subs"""
from requests import get


def number_of_subscribers(subreddit):
    """ show the number of subscribers in a subreddit """
    if subreddit is None or type(subreddit) is not str:
        return 0
    # Change the user agent
    headers = {'User-Agent': 'cmmolanos'}
    request = get('https://api.reddit.com/r/{}/about'.format(subreddit),
                  headers=headers)
    subscribers = request.json()

    sub = subscribers['data']['subscribers']
    return sub
