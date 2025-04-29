# Build et lancement des conteneurs
build:
	docker-compose build

up:
	docker-compose up -d --remove-orphans
	mkdir -p ft_transcendence/ft_transcendence/migrations
	touch ft_transcendence/ft_transcendence/migrations/__init__.py
	docker-compose run web python ft_transcendence/manage.py makemigrations ft_transcendence
	docker-compose run web python ft_transcendence/manage.py migrate --noinput
	docker-compose run web python ft_transcendence/manage.py compilemessages

down:
	docker-compose down --remove-orphans
	rm -rf ft_transcendence/ft_transcendence/__pycache__
	rm -rf staticfiles

logs:
	docker-compose logs -f

migrate:
	docker-compose run web python ft_transcendence/manage.py migrate --noinput

collectstatic:
	docker-compose run web python ft_transcendence/manage.py collectstatic --noinput --clear

reboot:
	docker system prune -a --volumes -f

down-server:
	sudo pkill -f runserver

reset-db:
	rm -rf ft_transcendence/ft_transcendence/migrations
	mkdir -p ft_transcendence/ft_transcendence/migrations
	touch ft_transcendence/ft_transcendence/migrations/__init__.py
	docker-compose run web python ft_transcendence/manage.py makemigrations ft_transcendence
	docker-compose run web python ft_transcendence/manage.py migrate --noinput

# Internationalisation (i18n)
makemessages:
	docker-compose run web python ft_transcendence/manage.py makemessages -l fr -l es

compilemessages:
	docker-compose run web python ft_transcendence/manage.py compilemessages

i18n: makemessages compilemessages
