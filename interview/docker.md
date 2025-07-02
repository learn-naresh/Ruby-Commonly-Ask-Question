To create a demo Docker setup for a **Ruby on Rails** application, you'll typically define:

* A **Dockerfile** (for the Rails app)
* A **docker-compose.yml** (to define services like app, database, Redis, etc.)
* Optional: initialization scripts (e.g., to setup DB)

---

### ✅ 1. `Dockerfile`

```Dockerfile
FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# Set working directory
WORKDIR /app

# Copy Gemfiles
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the app
COPY . .

# Precompile assets (if needed)
# RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
```

---

### ✅ 2. `docker-compose.yml`

```yaml
version: '3.9'

services:
  db:
    image: postgres:14
    volumes:
      - db-data:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: password
    ports:
      - "5432:5432"

  web:
    build: .
    command: bin/rails server -b 0.0.0.0 -p 3000
    volumes:
      - .:/app
    ports:
      - "3000:3000"
    depends_on:
      - db
    environment:
      DATABASE_URL: postgres://postgres:password@db:5432/postgres

volumes:
  db-data:
```

---

### ✅ 3. Sample `database.yml` (use ENV in Rails)

```yaml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  url: <%= ENV['DATABASE_URL'] %>

development:
  <<: *default

test:
  <<: *default

production:
  <<: *default
```

---

### ✅ 4. Init Commands

After building the container, run:

```bash
docker-compose build          # Build images
docker-compose up             # Start services
docker-compose run web rake db:create db:migrate # Initialize DB
```

---

Let me know if:

* You want to add **Redis**, **Sidekiq**, **Webpacker**, etc.
* Your app uses **Slim**, **React**, **Tailwind**, etc.
* You're using **PostgreSQL**, **MySQL**, or **SQLite**.
* You want to use **Hot reload** for development (via `docker-sync` or similar).
