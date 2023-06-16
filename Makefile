.PHONY: init
init	:
	@echo "リモート環境からDBの内容をローカルに落としてくる"
	bash init.sh env-monkey.ftt2306.dabaas.net monkey_ssh_key.pem

.PHONY: mysql
mysql	:
	@echo "mysqlのコンテナにアクセス"
	docker exec -it mysql bash

.PHONY: run
run	:
	@echo "スコアを計測"
	bash run.sh
