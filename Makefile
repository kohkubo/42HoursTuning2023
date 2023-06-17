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
	@echo "評価スクリプト(リストア・コンテナ再起動・マイグレーション・e2e テスト・負荷試験・採点)"
	bash run.sh

.PHONY: migrate
migrate	:
	@echo "リストア & マイグレーション"
	cd ./benchmarker && bash restore_and_migration.sh

.PHONY: bench
bench	:
	@echo "負荷試験 & 採点"
	cd ./benchmarker && bash run_k6_and_score.sh

.PHONY: score
score	: migrate bench
	@echo "リストア & マイグレーション & 負荷試験 & 採点"
