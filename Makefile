.PHONY: init
init	:
	@echo "init"
	bash init.sh env-monkey.ftt2306.dabaas.net monkey_ssh_key.pem

.PHONY: mysql
mysql	:
	@echo "mysql"
	docker exec -it mysql bash
