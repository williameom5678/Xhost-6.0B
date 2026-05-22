#!/bin/bash
#process갯수와 서버의 죽은 시간 체크

date >> /akom/bin/checklog/ps.log
ps ax >> /akom/bin/checklog/ps.log

date >> /akom/bin/checklog/w.log
w >> /akom/bin/checklog/w.log
