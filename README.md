# vimdc
[vim1]http://www.cnblogs.com/zhangsf/archive/2013/06/13/3134409.html
[vim2]http://vimdoc.sourceforge.net/htmldoc/usr_toc.html
# cscope 用在python
find . -name '*.py' > cscope.files
cscope  -bkq -i cscope.files 
