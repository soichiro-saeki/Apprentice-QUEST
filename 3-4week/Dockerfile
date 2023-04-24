FROM ruby:2.7
# var/wwwディレクトリを作成
RUN mkdir /var/www
# var/wwwディレクトリにコピー
COPY main.rb /var/www
#main.rbを実行する
CMD ["ruby","/var/www/main.rb"]
