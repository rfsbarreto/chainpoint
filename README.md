# README

## Running this app

You'll need to have [Docker](https://docs.docker.com/get-docker/) and [Docker-compose](https://docs.docker.com/compose/install/) installed.
It's available on Windows, macOS and most distros of Linux. If you're new to
Docker and want to learn it in detail check out the [additional resources
links](#learn-more-about-docker-and-ruby-on-rails) near the bottom of this
README.

If you're using Windows, it will be expected that you're following along inside
of [WSL or WSL
2](https://nickjanetakis.com/blog/a-linux-dev-environment-on-windows-with-wsl-2-docker-desktop-and-more).
That's because we're going to be running shell commands. You can always modify
these commands for PowerShell if you want.

#### Clone this repo anywhere you want and move into the directory:

```sh
git clone https://github.com/rfsbarreto/chainpoint
cd chainpoint

```

#### Build everything:

*The first time you run this it's going to take some minutes depending on your
internet connection speed and computer's hardware specs. That's because it's
going to download a few Docker images and build the Ruby + Yarn dependencies.*

```sh
docker-compose up --build
```

Now that everything is built and running we can treat it like any other Rails
app.


#### Setup database and webpacker:

I made a setup script to put database and webpacker ready for the app to be ruuning

```sh
# You can run this from a 2nd terminal.
./setup.sh
```

#### Check it out in a browser:

Visit <http://localhost:3000> in your favorite browser.

#### Running the test suite:

```sh
# You can run this from the same terminal as before.
docker-compose exec web bundle exec rspec
```
