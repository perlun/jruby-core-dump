[![Build Status](https://travis-ci.org/perlun/jruby-core-dump.svg?branch=master)](https://travis-ci.org/perlun/jruby-core-dump)

# jruby-core-dump

This repo illustrates a core dump with JRuby

```
$ rvm install jruby-9.1.15.0
$ bundle exec rspec foo.rb
```

The output you get is roughly this:

```
$ bundle exec rspec foo.rb

foo
#
# A fatal error has been detected by the Java Runtime Environment:
#
#  SIGSEGV (0xb) at pc=0x000000010608a6a0, pid=29946, tid=0x0000000000000307
#
# JRE version: Java(TM) SE Runtime Environment (8.0_152-b16) (build 1.8.0_152-b16)
# Java VM: Java HotSpot(TM) 64-Bit Server VM (25.152-b16 mixed mode bsd-amd64 compressed oops)
# Problematic frame:
# V  [libjvm.dylib+0x48a6a0]
#
# Failed to write core dump. Core dumps have been disabled. To enable core dumping, try "ulimit -c unlimited" before starting Java again
#
# An error report file with more information is saved as:
# /Volumes/git/perlun/jruby-core-dump/hs_err_pid29946.log
#
# If you would like to submit a bug report, please visit:
#   http://bugreport.java.com/bugreport/crash.jsp
#
Abort trap: 6
```

I noted that you can even trigger the bug this easily:

```shell
$ ruby -e "Process.kill('USR2', Process.pid)"
```

The above code crashes the JVM with a `SIGSEGV` on JRuby, whereas on MRI it outputs this:

```shell
$ ruby -e "Process.kill('USR2', Process.pid)"
User defined signal 2: 31
```

Verified on MRI 2.3.6 and 2.5.0.
