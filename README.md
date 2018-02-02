# README

## Rockers Records

Alamo Records is a online store that sells vintage vinyl records. It is built on the [Ruby on Rails](http://www.rubyonrails.org) web framework and consists of the following models:

1. Publisher - a publisher sells albums.
2. Album - albums are sold by publishers and include many songs.
3. Song - a song is recorded onto one album. It is written by one artist.
4. Artist - an artist writes songs.

The relationships between models are represented in the following diagram:

![Rockers Records model diagram](public/alamo_records_diagram.png)


## API
(http://localhost:3000/swagger)