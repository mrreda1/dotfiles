#!/usr/bin/python3

from time import time
import requests
import hashlib
import random


def main():
    """ To get your API-key visit codeforces.com/settings/api
    Then click on 'Add API key' then pass your key and secret
    For more info about API visit codeforces.com/apiHelp ."""

    contests_list("7a02319483eec5807c2d283c6420c7a77bfa3672",
                  "a45591ebc3ac1cc55685df64e222233566caa069")


def contests_list(apiKey, secret):
    """ Get info about coming contests """

    crnt_time = int(time())
    methodName = "contest.list"
    rand = random.randint(100000, 999999)
    encrypt = "{}/{}?apiKey={}&time={}#{}".format(
        rand, methodName, apiKey, crnt_time, secret)
    hash = hashlib.sha512(encrypt.encode('UTF-8')).hexdigest()
    apiSig = "{}{}".format(rand, hash)
    args = "apiKey={}&time={}&apiSig={}".format(apiKey, crnt_time, apiSig)
    target = "https://codeforces.com/api/{}?{}".format(methodName, args)
    data = requests.get(target).json()
    next = 0
    if (data["status"] == "FAILED"):
        print("...")
        return
    for contest in data['result']:
        if (contest["phase"] == "BEFORE"):
            next = -contest["relativeTimeSeconds"]
        elif (contest["phase"] == "CODING"):
            remain = contest["durationSeconds"]-contest["relativeTimeSeconds"]
            if (remain/(60*60) > 10):
                continue
            print(f"{int(remain/(60*60)):02d}:{int(remain%(60*60)/60):02d}")
            return
    print(f"{int(next/(60*60*24)):02d}:"
          f"{int(next%(60*60*24)/(60*60)):02d}:"
          f"{int(next%(60*60)/60):02d}")


try:
    main()
except:
    print("**:**")
