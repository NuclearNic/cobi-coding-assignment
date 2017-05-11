README
======

## Notes
* There is a version of this assignment running on Heroku. It is on a free dyno so it may 
take up to 30 seconds to start up the first time. It can be found here: https://cobi-coding-assignment.herokuapp.com/
* Storing author_id and genre_id on a book instead of strings. 
* There is no authorization implementation, so CRSF prevention has been omitted.
* **In all urls below, :id refers to the column 'id' shown in the index view.**

## API Endpoints

* Show all books: https://cobi-coding-assignment.herokuapp.com/api/v1/books.json
* Show specific book: https://cobi-coding-assignment.herokuapp.com/api/v1/books/:id.json


### Bonus Section:

## Storing Book Cover as binary

* The book cover is stored as both an image file on an S3 bucket, and (after being converted on upload) as a base64
string. There is a prefix added to the string: ** "data:image/file_extension,base64," + base64 string. **

## Extended APIs

* Some assumptions had to be made here. Overall, whenever the basic functionality was in place
then that was assumed to be a satisfactory solution. Books can be added, edited and removed.
* Use HTML Body for sending values (title, description, etc.). Values are allowed to be blank.
* Since it wasn't requested, adding cover art through an HTTP POST is not implemented. I.e. images have to 
be uploaded from the CMS backend.


# API Endpoints for Create/Update/Destroy of Books:

* Note that a book requires a unique title. Create new book: **POST** https://cobi-coding-assignment.herokuapp.com/api/v1/books.json
* Edit existing book: **PATCH** https://cobi-coding-assignment.herokuapp.com/api/v1/books/:id.json
* Delete existing book: **DELETE** https://cobi-coding-assignment.herokuapp.com/api/v1/books/:id.json

* For CREATE and UPDATE above, the keys added to the body should be: title, description, year, author_id, genre_id. (again note that author_id and genre_id are the primary keys of the respective models).
* All of the above was tested with Postman.

