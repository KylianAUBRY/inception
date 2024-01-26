all:
	@printf "Launching...\n"
	@mkdir -p $(HOME)/data/wordpress
	@mkdir -p $(HOME)/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up

build:
	@printf "Building...\n"
	@mkdir -p $(HOME)/data/wordpress
	@mkdir -p $(HOME)/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up --build

down:
	@printf "Stopping...\n"
	@docker-compose -f ./srcs/docker-compose.yml down

re: down
	@printf "Rebuilding...\n"
	@mkdir -p $(HOME)/data/wordpress
	@mkdir -p $(HOME)/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up --build

clean: down
	@printf "Cleaning...\n"
	@docker system prune -a

fclean:
	@printf "Total Cleaning...\n"
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	rm -rf $(HOME)/data/wordpress
	rm -rf $(HOME)/data/mariadb
	
.PHONY	: all build down re clean fclean
