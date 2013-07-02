# Harvest Django Template

## Prerequisites

- Python 2.7

## Setup & Install

Install [virtualenv](http://pypi.python.org/pypi/virtualenv):

```bash
$ wget http://pypi.python.org/packages/source/v/virtualenv/virtualenv-1.8.2.tar.gz
$ tar zxf virtualenv-1.8.2.tar.gz
$ cd virtualenv-1.8.2
$ python setup.py install
```
_You may need to do that last step as root. Just make sure you use the
correct Python binary for OSes with multiple Python versions._

Create a virtual environment for the project:

```bash
$ virtualenv myproject-env
$ cd myproject-env
$ source bin/activate
$ pip install django
```

Now run the `startproject` command:

```bash
$ django-admin.py startproject --template https://github.com/bruth/badass-django-template/zipball/master -e py,ini,gitignore,in,conf,md,sample -n Makefile myproject
$ cd myproject
```

Install the base requirements:

```bash
$ pip install -r requirements.txt
```

A few optional dependencies can be installed which are listed on the
[Avocado docs](http://cbmi.github.com/avocado/).

Then either start the built-in Django server:

```bash
$ ./bin/manage.py runserver
```

or run a `uwsgi` process:

```bash
$ uwsgi --ini server/uwsgi/local.ini --protocol http --socket 127.0.0.1:8000 --check-static _site
```

## Features

- clean project structure
    - `_site` directory for web server document root
        - copied static files and user uploaded media files
        - works well with nginx's `try_files` directive
        - `maintenance` directory for toggling maintenance mode's
- server configurations for nginx, uWSGI, and Supervisor
    - note: the paths will need to be updated to match your environment
- tiered settings for easier cross-environment support
    - `global_settings.py` for environment-independent settings
    - `local_settings.py` for environment-specific settings (not versioned)
    - `settings.py` for bringing them together and post-setup
- `local_settings.py.sample` template
- integration with [r.js](https://github.com/jrburke/r.js/)
    - `make optimize`
    - includes `app.build.js` file for single-file JavaScript optimization
    - compiles javascript/src => javascript/min
- context processor for including more direct static urls
    - `{{ CSS_URL }}`
    - `{{ JAVASCRIPT_URL }}`
    - `{{ IMAGES_URL }}`
- full-featured fabfile.py for one-command deployment

## Dependencies

- Python 2.7 (because that's how I roll)

## Fabfile Commands

- `mm_on` - turns on maintenance mode
- `mm_off` - turns off maintenance mode
- `deploy` - deploy a specific Git tag on the host


## Local Settings

`local_settings.py` is intentionally not versioned (via .gitignore). It should
contain any environment-specific settings and/or sensitive settings such as
passwords, the `SECRET_KEY` and other information that should not be in version
control. Defining `local_settings.py` is not mandatory but will warn if it does
not exist.


