# README

The **Fleurissant API** is a backend application for the Fleurissant app, built with Ruby on Rails. It provides endpoints and functionality to access storefront, manage user groups and inventory.

## Features

- RESTful API for managing plant data.
- Containerized with Docker; continuous integration with Kamal
- Manage product images with ActiveStorage via AWS S3
- TDD with RSpec
- auth with [devise-jwt](https://github.com/waiting-for-dev/devise-jwt)
- stripe integration for checkout
- user management for admin and customers