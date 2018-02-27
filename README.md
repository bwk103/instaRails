[![Build Status](https://travis-ci.org/bwk103/instaRails.svg?branch=master)](https://travis-ci.org/bwk103/instaRails)

# InstaRails

![screen shot 2018-02-26 at 18 45 05](https://user-images.githubusercontent.com/8667021/36688740-3ed9bd14-1b25-11e8-87e2-be05b7cb637b.png)

As part of the Makers Academy syllabus, I was asked to produce an Instagram clone using Ruby on Rails.  

My solution, instaRails, allows users to sign up/in/out, submit posts and
comment/like other users' posts.
## Getting Started

### Prerequisites

#### Ruby & RVM
It's a Ruby project, so it's probably for the best if you you have Ruby installed.  If you're on Linux or a Mac then you're probably good to go but otherwise download and install it from [here](https://www.ruby-lang.org/en/downloads/).

#### Bundler
The easiest way to get started is to install all of the requisite gems and dependencies via Bundler.  If you've not used Bundler before, run the following at the command line:

`gem install bundler`

#### ImageMagick
instaRails uses ImageMagick to magically resize images uploaded by users as posts or profile pictures.  To install ImageMagick, simply enter the following at the command line:

`brew install imagemagick`

### Installing

Firstly, download a copy of this repository by running the following command:

`git clone https://github.com/bwk103/instaRails.git`

Next, install the necessary gems using the following commands:

`bundle update`

`bundle install`

To create the necessary database tables, run the following command:

`rails db:migrate`

If you want to seed the databse with some example users (images not included in github repo), run

`rails db:seed`

To run instaRails on a local server run the following command and navigate to localhost + 'YOUR_PORT_NUMBER'.

`rails server`

By default the application will be run on localhost:3000.

### Using instaRails

Create an account, add a post and enjoy the lack of FOMO that comes with a single-person version of Instagram.

![screen shot 2018-02-26 at 18 39 26](https://user-images.githubusercontent.com/8667021/36688511-98b187a0-1b24-11e8-9419-96434fbabae2.png)

![screen shot 2018-02-26 at 18 41 58](https://user-images.githubusercontent.com/8667021/36688639-004f9e88-1b25-11e8-9f85-d533f4573be8.png)

![screen shot 2018-02-26 at 18 47 53](https://user-images.githubusercontent.com/8667021/36688845-97fc366a-1b25-11e8-8bee-eea9ec485082.png)

## Running the tests

It couldn't be any simpler to run my tests.  Simply enter the following command, sit back, and enjoy all the green text.

`rails test`

If, for some reason, you don't have the time to wait for 202 assertions to complete, you can also choose to run the model, controller and integration tests separately by running the following commands:

`rails test:models`

`rails test:controllers`

`rails test:integration`

## Built With

- [Rails](http://rubyonrails.org/) - Web framework

- [MiniTest](https://github.com/blowmage/minitest-rails) - Testing framework

- [Bootstrap](http://getbootstrap.com/) - Front end component library

- [BCrypt](https://github.com/codahale/bcrypt-ruby) - Password encryption

- [jQuery](http://api.jquery.com/) - HTML document traversal

- [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) & [ImageMagick](https://github.com/ImageMagick/ImageMagick) - image optimisation

## Author

Ben Kielty

## Acknowledgments

- Challenge set by [Makers Academy](http://www.makersacademy.com/)
- Rails tutorials from [Michael Hartl](https://www.railstutorial.org/)
- Landing Page background from [Unsplash](https://unsplash.com/)
- Seed profiles from [Random User](https://randomuser.me/)
- Fake bios from [Silly Twitter Bio](http://www.sillytwitterbio.com/)
