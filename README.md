## Test task (Blog)

[ Admin panel ](https://intense-cove-86046.herokuapp.com/admin/posts)
[Blog page](https://intense-cove-86046.herokuapp.com/)

The system consists of two parts: user and admin.
## User part 
Consists of two types of pages:
- Page with all publications.
  > List of all publications with pagination. The publication cell includes a title, an attached picture, and a summary (~ 150 characters) and a link to view the publication.
- The specific publication page.
  >The publication contains a title, an attached picture, the text of the article, a block with “similar articles” (randomly display 2-3 publications), also a simple viewing counter is implemented.

## Admin part

Self-written, without using active_admin or rails_admin.
The Admin panel has two roles: 
- Admin 
  >The **admin** has ability to create/delete copywriters and create/read/update/delete articles.
- Copywriter
  >The **copywriter** has the ability to create/update only his articles. He doesn’t have access to manage publications of others.

## Credentials

Admin

```
login: 'admin@example.com'
password: '123456789'
```
Copywriter

```
login: 'copy@example.com'
password: '123456789'
```
