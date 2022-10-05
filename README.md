# [Ask Me](https://askmeow.herokuapp.com/)
Application for ask questions to users. Analog AskFm

In app users may to registrat. Authenticate or anomimous user can ask other regisrated user. User who get a questions, can answer or delete the question.

## Run instruction
### Versions
```
ruby '3.1.2'
rails '7.0.3'
```

1. Clone the repository to your local computer by typing in the terminal:
```
git clone https://github.com/dasmodal/askme.git
```
2. Open directory with the app:
```
cd askme
```
3. Run bundler for install gems dependencies:
```
bundle
```
4. Roll db migrations:
```
bundle exec rails db:migrate
```
5. Finally, you can start the app:
```
bundle exec rails s
```

## Credentials
For correct work allside functions (ReCapcha as example), you need to remove `config/credentials.yml.enc` and create new credentials:

```
EDITOR=vi rails credentials:edit
```
and write new secret keys:

```
recaptcha_v2:
  site_key: xxxxxxxxxxxxxxxxxxxxxxxx
  secret_key: xxxxxxxxxxxxxxxxxxxxxxxx
```
`master.key` will be create automatically.