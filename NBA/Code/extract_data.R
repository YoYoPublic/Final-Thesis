library(XML)
library(RCurl)
library(stringr)
u = 'https://stats.nba.com/teams/boxscores-traditional/'
text <- readLines(u)#读入html源文件
name_begin <- grep('<div class="stats-glossary" ng-show="showGlossary">',text)#找到开始提取的位置
name_end <- grep('</div> <!-- .stats-glossary -->',text)#匹配到结尾的位置
Content <- text[(name_begin+2):name_end]#选中中间的所有HTML代码
#提取含有名字的html文件中的文字，因为他的标签是<dt>和<dd>交叉着的
Content <- str_remove(Content,pattern = "<dd>")
Content <- str_remove(Content,pattern = "<dt>")
Content <- str_remove(Content,pattern = "</dt>")
Content <- str_remove(Content,pattern = "</dd>")
Content_name <- str_remove(Content,pattern = " ")[seq(1,42,by=2)]
Content_explain <-str_remove(Content,pattern = " ")[seq(2,43,by=2)]
