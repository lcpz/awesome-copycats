# Please, read me!

So that I can help you quickly and without having to redirect you here.

# If you have a question

Take the following steps:

1. Use a web search engine
2. Search in [Awesome doc](https://awesomewm.org/doc)
3. Ask the [community](https://awesomewm.org/community)

and, if you still don't have an answer, you can ask here.

**Please be warned:** if your question is unrelated to this repository, a reply is only an act of kindness.

# If you have an issue <a name="issuesec"/>

First do

1. search the [issues section](https://github.com/lcpz/awesome-copycats/issues) and
2. search [lain issues section](https://github.com/lcpz/lain/issues) and
3. search [lain wiki](https://github.com/lcpz/lain/wiki) and
4. try with default Awesome configuration, usually located in `/etc/xdg/awesome/rc.lua` or `/usr/local/etc/xdg/awesome/rc.lua`.

If you can't find a solution and your issue doesn't happen with default configuration, then go ahead and provide:

* output of `awesome -v` and `lua -v`
* expected behavior and actual behavior
* steps to reproduce the problem
* X error log (if needed)

# If Awesome fails to start

Then something went wrong during its initialisation. You have to provide X error
log. There are two ways:

1. Restart X like this:
  ```shell
  startx -- -keeptty -nolisten tcp > $HOME/.xorg.log 2>&1
  ```
  the error log will be output into `$HOME/.xorg.log`.

2. Use [Xephyr](https://wikipedia.org/wiki/Xephyr):
  ```shell
  # set screen size as you like
  Xephyr :1 -screen 1280x800 2> stdout.txt & DISPLAY=:1 awesome
  ```
  the error log will be output into the file `stdout.txt`.

Before reporting, read the log and see if you can solve it yourself. If you can't, then follow the [previous section](#issuesec).

# If you have a new feature or theme request

Write a detailed description of the desired design, preferably with screenshots or mockups.
