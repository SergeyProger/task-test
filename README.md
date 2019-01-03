# Test task project

Task description

Create a Rails application, which will convert a number to a money string (please, choose Russian or Ukrainian language). 
Application has to convert 1 to “одна гривна“, 1234567 to “один миллион двести тридцать четыре тысячи пятьсот шестьдесят семь гривен“, 
etc. Words should have correct endings: “1 гривна“, “2 гривны“, “5 гривен“, “3 миллиона“, “3 тысячи“, etc. (provided examples are for Russian)

Implement main logic on server-side (Ruby). It’s a logical test, so solution shouldn’t be based on a gem or something like that.

Your app should have one page which would consist of one text input (without any submit buttons).
 Once number is entered/changed its text equivalent should appear below.

Application should work properly with integer numbers from 0 to 999999999.
You may use a front-end framework: Vue, React or Angular.
Please do this on your github account as a public repo. Make frequent commits and use best practices. 

## Project installation

1) git clone https://github.com/SergeyProger/task-test.git
2) cd task-test/
3) bundle install
4) yarn install
5) rails s
6) To run the tests you need to create a database using the console command rake db:create
7) Тests are run by the command - rspec

## Heroku project
The work of the project can be viewed on [heroku](https://convert-ru.herokuapp.com)

## Task execution
 When performing this task, the Russian language was chosen and the corresponding currency was rubles.
I use the front-end framework: [React](https://github.com/reactjs/react-rails).
Implemented the main server-side logic (Ruby). The logic is moved to the TextConvert class in the [app/lib](https://github.com/SergeyProger/task-test/blob/master/app/lib/text_convert.rb) folder.

## P.S.
 Thank you for the interesting task.
