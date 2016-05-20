# Redmine Raker Plugin

At some point you can face redmine instance w/o backround job processor and access to command line. We all need to execute rake tasks so for *SHORT* and *FAST* rake tasks you can poll em with with this plugin.

## Features

Plugin will give you simple way of runing rake tasks

## Compatibility
  - Tested with Redmine 2.4.x - 3.1.x

## Setup
### Installation
Clone it into under plugins folder:
````
  $ git clone https://github.com/noma4i/redmine_raker.git raker
````
### Configuration
No Configuration needed. Make sure you have any admin *API access key*.
You can get one from */my/account*

## Usage

*http://REDMINE_URL/raker/run_task?token=YOUR_API_KEY&task=RAKE_TASK_NAME*

```
http://example.com/raker/run_task?token=7168ca72d5253b6e18e946b1d7506e7556c09541e&task=redmine:email:receive_imap
```

You can assign cron job now. Like:

```
1 1 * * 0  /usr/bin/curl --silent http://example.com/raker/run_task?token=7168ca72d5253b6e18e946b1d7506e7556c09541e&task=redmine:email:receive_imap &>/dev/null

```

## Author

[Alexander Tsirel @noma4i](https://github.com/noma4i)

## Contribution Guide

Open Issue or send PR ;)
