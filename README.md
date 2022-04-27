# Assignment 2: web aplikacija osnove
## Upute za lokalno pokretanje aplikacije
### Ruby on Rails verzije

- ** Ruby -v 3.2.1 **
- ** Rails -v 5.4 **

### Kloniranje i pokretanje

Koristeći terminal:

1. `git clone https://github.com/piga/ingemark.git`
2. uđite u mapu projekta
3. provjerite da imate instaliran postgresql server i da radi
4. `bundle install`
5. `rails db:setup` Ako ova naredba ne radi provjerite da rails user ima odgovarajuče uloge unutar postgresql. Možda ćete ručno trebati stvoriti tu bazu podataka unutar postgresql. Ime baze i korisnika možete pronaći u ** database.yml ** . [Objašnjenje1](https://stackoverflow.com/questions/24073658/running-a-rails-app-locally-creating-local-version-of-database-schema-with-rak) [Objašnjenje2](https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres)
6. `rails server`

## Nedostatci

- Index stranica ne izgleda dobro na mobitelu. I oni mali badgeovi bi mogli zapravo biti botuni edit i destroy.
- Pagination.
- Razne kategorije korisnika.
- Životopis nije dodan u prijavu, je u formu za prijavu, ali nema uploada niti povezanosti.



