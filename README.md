## BetterDoctorProxy

#### Description:

BetterDoctorProxy allows users to search BetterDoctor for doctor information by name

#### How to run:

1. (OPTIONAL) set the `BETTER_DOCTOR_USER_KEY` in /config/initializers/api.rb to your BetterDoctor API key
2. navigate to the root directory in your terminal
3. run the following commands:
  - `bundle install`
  - `bundle exec rails dev:cache`
  - `bundle exec rails s`
4.  in another terminal window or tab, run:
  -  `curl http://localhost:3000/api/v1/doctors/search?name=<name to search for>`
