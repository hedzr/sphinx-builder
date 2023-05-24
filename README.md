# sphinx-builder

This is a docker container for sphinx building. It extends official sphinx docker image `sphinxdoc/sphinx`([@GitHub](https://www.github.com/sphinx-doc/docker)) with usesful plugins.

These modules are included:

- matplotlib
- numpy
- ...
- Sphinx                       : 5.3.0
- sphinx-autobuild             : 2021.3.14
- sphinx-basic-ng              : 1.0.0b1
- sphinx-book-theme            : 1.0.1
- sphinx-copybutton            : 0.5.2
- sphinx_design                : 0.4.1
- sphinx-intl                  : 2.1.0
- sphinx-rtd-theme             : 1.2.1
- sphinx-tabs                  : 3.4.1
- sphinx-thebe                 : 0.2.1
- sphinx-togglebutton          : 0.3.2
- sphinxcontrib-applehelp      : 1.0.2
- sphinxcontrib-devhelp        : 1.0.2
- sphinxcontrib-htmlhelp       : 2.0.0
- sphinxcontrib-jquery         : 4.1
- sphinxcontrib-jsmath         : 1.0.1
- sphinxcontrib-mermaid        : 0.8.1
- sphinxcontrib-qthelp         : 1.0.3
- sphinxcontrib-serializinghtml: 1.1.5
- sphinxext-opengraph          : 0.8.2
- sphinxext-rediraffe          : 0.2.7
- ...

## Usage

Create a Sphinx project:

```bash
docker run -it --rm -v /path/to/document:/docs hedzr/sphinx-builder sphinx-quickstart
```

Build HTML document:

```bash
docker run --rm -v /path/to/document:/docs hedzr/sphinx-builder make html
```

Build EPUB document:

```bash
docker run --rm -v /path/to/document:/docs hedzr/sphinx-builder make epub
```

Build PDF document [**NOT YET**]:

```bash
docker run --rm -v /path/to/document:/docs hedzr/sphinx-builder:latexpdf make latexpdf
```

### Tips

To install additional dependencies, use ``hedzr/sphinx-builder`` as a base image:

```dockerfile
# in your Dockerfile
FROM sphinxdoc/sphinx

WORKDIR /docs
ADD requirements.txt /docs
RUN pip3 install -r requirements.txt
```

## Information

### Known packages (py3)

```bash
#8 149.0 Package                       Version
#8 149.0 ----------------------------- ---------
#8 149.0 accessible-pygments           0.0.4
#8 149.0 alabaster                     0.7.12
#8 149.0 asttokens                     2.2.1
#8 149.0 attrs                         23.1.0
#8 149.0 Babel                         2.10.3
#8 149.0 backcall                      0.2.0
#8 149.0 beautifulsoup4                4.12.2
#8 149.0 breathe                       4.35.0
#8 149.0 certifi                       2022.9.24
#8 149.0 charset-normalizer            2.1.1
#8 149.0 click                         8.1.3
#8 149.0 colorama                      0.4.6
#8 149.0 comm                          0.1.3
#8 149.0 contourpy                     1.0.7
#8 149.0 cycler                        0.11.0
#8 149.0 debugpy                       1.6.7
#8 149.0 decorator                     5.1.1
#8 149.0 docutils                      0.18.1
#8 149.0 executing                     1.2.0
#8 149.0 fastjsonschema                2.17.1
#8 149.0 fonttools                     4.39.4
#8 149.0 furo                          2023.3.27
#8 149.0 greenlet                      2.0.2
#8 149.0 idna                          3.4
#8 149.0 imagesize                     1.4.1
#8 149.0 importlib-metadata            6.6.0
#8 149.0 ipykernel                     6.23.1
#8 149.0 ipython                       8.13.2
#8 149.0 jedi                          0.18.2
#8 149.0 Jinja2                        3.1.2
#8 149.0 jsonschema                    4.17.3
#8 149.0 jupyter-cache                 0.6.1
#8 149.0 jupyter_client                8.2.0
#8 149.0 jupyter_core                  5.3.0
#8 149.0 kiwisolver                    1.4.4
#8 149.0 linkify-it-py                 2.0.2
#8 149.0 livereload                    2.6.3
#8 149.0 markdown-it-py                2.2.0
#8 149.0 MarkupSafe                    2.1.1
#8 149.0 matplotlib                    3.7.1
#8 149.0 matplotlib-inline             0.1.6
#8 149.0 mdit-py-plugins               0.3.5
#8 149.0 mdurl                         0.1.2
#8 149.0 myst-nb                       0.17.2
#8 149.0 myst-parser                   0.18.1
#8 149.0 nbclient                      0.7.4
#8 149.0 nbformat                      5.8.0
#8 149.0 nest-asyncio                  1.5.6
#8 149.0 numpy                         1.24.3
#8 149.0 packaging                     21.3
#8 149.0 parso                         0.8.3
#8 149.0 pexpect                       4.8.0
#8 149.0 pickleshare                   0.7.5
#8 149.0 Pillow                        9.2.0
#8 149.0 pip                           22.3
#8 149.0 platformdirs                  3.5.1
#8 149.0 prompt-toolkit                3.0.38
#8 149.0 psutil                        5.9.4
#8 149.0 ptyprocess                    0.7.0
#8 149.0 pure-eval                     0.2.2
#8 149.0 pydata-sphinx-theme           0.13.3
#8 149.0 Pygments                      2.13.0
#8 149.0 pyparsing                     3.0.9
#8 149.0 pyrsistent                    0.19.3
#8 149.0 python-dateutil               2.8.2
#8 149.0 pytz                          2022.4
#8 149.0 PyYAML                        6.0
#8 149.0 pyzmq                         25.0.2
#8 149.0 requests                      2.28.1
#8 149.0 setuptools                    63.2.0
#8 149.0 six                           1.16.0
#8 149.0 snowballstemmer               2.2.0
#8 149.0 soupsieve                     2.4.1
#8 149.0 Sphinx                        5.3.0
#8 149.0 sphinx-autobuild              2021.3.14
#8 149.0 sphinx-basic-ng               1.0.0b1
#8 149.0 sphinx-book-theme             1.0.1
#8 149.0 sphinx-copybutton             0.5.2
#8 149.0 sphinx_design                 0.4.1
#8 149.0 sphinx-intl                   2.1.0
#8 149.0 sphinx-rtd-theme              1.2.1
#8 149.0 sphinx-tabs                   3.4.1
#8 149.0 sphinx-thebe                  0.2.1
#8 149.0 sphinx-togglebutton           0.3.2
#8 149.0 sphinxcontrib-applehelp       1.0.2
#8 149.0 sphinxcontrib-devhelp         1.0.2
#8 149.0 sphinxcontrib-htmlhelp        2.0.0
#8 149.0 sphinxcontrib-jquery          4.1
#8 149.0 sphinxcontrib-jsmath          1.0.1
#8 149.0 sphinxcontrib-mermaid         0.8.1
#8 149.0 sphinxcontrib-qthelp          1.0.3
#8 149.0 sphinxcontrib-serializinghtml 1.1.5
#8 149.0 sphinxext-opengraph           0.8.2
#8 149.0 sphinxext-rediraffe           0.2.7
#8 149.0 SQLAlchemy                    2.0.15
#8 149.0 stack-data                    0.6.2
#8 149.0 tabulate                      0.9.0
#8 149.0 tornado                       6.3.2
#8 149.0 traitlets                     5.9.0
#8 149.0 typing_extensions             4.6.1
#8 149.0 uc-micro-py                   1.0.2
#8 149.0 urllib3                       1.26.12
#8 149.0 wcwidth                       0.2.6
#8 149.0 wheel                         0.37.1
#8 149.0 zipp                          3.15.0
```

## LICENSE

Apache 2.0
