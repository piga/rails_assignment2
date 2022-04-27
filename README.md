# Assignment 2: web aplikacija osnove
## Upute za lokalno pokretanje aplikacije
### Ruby on Rails verzije

- ** Ruby -v 3.2.1 **
- ** Rails -v 5.4 **

### Kloniranje i pokretanje

Koristeći terminal:

1. `git clone https://github.com/piga/rails_assignment2.git`
2. uđite u mapu projekta
3. provjerite da imate instaliran postgresql server i da radi. Mislim da meni radi zadani korisnik, tzv. database role
4. `bundle install`
5. `rails db:setup` Ako ova naredba ne radi provjerite da rails user ima odgovarajuče uloge unutar postgresql. Možda ćete ručno trebati stvoriti tu bazu podataka unutar postgresql. Ime baze i korisnika možete pronaći u ** database.yml ** . [Objašnjenje1](https://stackoverflow.com/questions/24073658/running-a-rails-app-locally-creating-local-version-of-database-schema-with-rak) [Objašnjenje2](https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres)
6. `rails server`
7. Ako bude problema sa webpackerom onda probajte bundle exec rake webpacker:install 
Meni je pomoglo


## Nedostatci

- Index stranica ne izgleda dobro na mobitelu. I oni mali badgeovi bi mogli zapravo biti botuni edit i destroy.
- Pagination.
- Razne kategorije korisnika.
- Životopis nije dodan u prijavu, je u formu za prijavu, ali nema uploada niti povezanosti.
- Editiranje oglasa nisam uredio. Ne izgleda lijepo.
- Bootstrap ikone nisam stavio u botune jer sam imao problema sa link_to u bloku napisan. Nikako nisam mogao css klase  dodati takvim linkovima.
- Docker Postgresql. Ja sam bazu instalirao na klasični način bez dockera i pokrenuo server.

## Što mi je oduzelo najviše vremena?

- Webpaker i webpaker live server
- Bootstrap, popper i tooltips
- Capybara vissible i hidden elementi
- Previše sam radio sa modalima i zbog toga su mi neke stvari bile teže u Capibara testovima.
- Rspec 
- Pokretanje postgresql


