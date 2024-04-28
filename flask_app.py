from flask import Flask, request, render_template, redirect, url_for, flash,jsonify,session
from flask_mysqldb import MySQL

app = Flask(__name__)

app.secret_key = 'prit_dhabaliya' 
# MySQL configurations
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'Prit@1511'
app.config['MYSQL_DB'] = 'adt_project'

mysql = MySQL(app)

@app.route('/')
def home():
    return render_template('login.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']  # In production, consider hashing the password

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM `user` WHERE username = %s AND password = %s", (username, password))
        user = cursor.fetchone()
        cursor.close()

        if user:
            session['logged_in'] = True
            session['user'] = {'id': user[0], 'name': user[1]}  # Adjust the indices based on your database schema
            return redirect(url_for('welcome'))  # Redirect to the welcome page on successful login
        else:
            flash('Sorry, you are not registered')
            return redirect(url_for('register'))  # Redirect to the registration page if user not found
    
    return render_template('login.html')


@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']     

        # Insert the new user into the database
        cursor = mysql.connection.cursor()
        try:
            cursor.execute("INSERT INTO `user` (username, password) VALUES (%s, %s)", (username, password))
            mysql.connection.commit()
            flash('You have successfully registered!')
            return redirect(url_for('login'))
        except Exception as e:
            mysql.connection.rollback()
            flash(str(e))  # You might want to handle this more discreetly in a production environment
        finally:
            cursor.close()

    return render_template('register.html')


@app.route('/admin')
def admin():
    # Render admin login page
    return render_template('adminlogin.html')

@app.route('/admin_login', methods=['POST'])
def admin_login():
    # Fetch form data
    admin_id = request.form['adminId']
    admin_password = request.form['adminPassword']

    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM `admin` WHERE username = %s AND `password` = %s", (admin_id, admin_password,))
    admin = cursor.fetchone()
    cursor.close()

    if admin:
        # Successful login, redirect to admin.html
        return redirect(url_for('admin_home'))
    else:
        flash('Invalid admin credentials')
        return redirect(url_for('admin'))

@app.route('/admin_home')
def admin_home():
    # Ensure this route is protected and only accessible by a logged-in admin
    return render_template('admin.html')
    
@app.route('/manage_books')
def manage_books():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM books")
    books = cursor.fetchall()
    cursor.close()
    return render_template('manage_books.html', books=books)

@app.route('/add_book', methods=['GET', 'POST'])
def add_book():
    if request.method == 'POST':
        title = request.form['title']
        author_id = request.form['author_id']
        genre_id = request.form['genre_id']
        publishing_year = request.form['publishing_year']
        average_rating = request.form['average_rating']
        ratings_count = request.form['ratings_count']
        publisher_id = request.form['publisher_id']
        sale_price = request.form['sale_price']
        sales_rank = request.form['sales_rank']
        units = request.form['units']

        cursor = mysql.connection.cursor()
        cursor.execute("INSERT INTO books (Title, AuthorID, GenreID, PublishingYear, AverageRating, RatingsCount, PublisherID, SalePrice, SalesRank, units) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                       (title, author_id, genre_id, publishing_year, average_rating, ratings_count, publisher_id, sale_price, sales_rank, units))
        mysql.connection.commit()
        cursor.close()
        flash('Book successfully added!')
        return redirect(url_for('manage_books'))
    return render_template('add_book.html')

@app.route('/delete_book/<int:book_id>', methods=['POST'])
def delete_book(book_id):
    cursor = mysql.connection.cursor()
    cursor.execute("DELETE FROM books WHERE BookID = %s", [book_id])
    mysql.connection.commit()
    cursor.close()
    flash('Book successfully deleted!')
    return redirect(url_for('manage_books'))

# Placeholder route for editing books
@app.route('/edit_book/<int:book_id>', methods=['GET', 'POST'])
def edit_book(book_id):
    # Handle GET to show the edit form with book data pre-filled
    # Handle POST to update book data in the database
    # This route will require a template with a form for editing book data
    pass

@app.route('/show_transactions')
def show_transactions():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM transactions")
    transactions = cursor.fetchall()
    cursor.close()
    return render_template('show_transactions.html', transactions=transactions)


@app.route('/welcome')
def welcome():
    if 'logged_in' in session and session['logged_in']:
        return render_template('welcome.html')
    else:
        return redirect(url_for('login'))  # Redirect to login if not logged in





lid=[]
@app.route('/search_books', methods=['POST'])
def search_books():
    search_query = request.form['search']
    cursor = mysql.connection.cursor()
    cursor.execute("""
    SELECT 
    books.BookID, 
    books.Title, 
    authors.AuthorName, 
    authors.AuthorRating,
    genres.GenreName, 
    publishers.PublisherName,
    books.PublishingYear,
    books.AverageRating,
    books.SalesRank,               
    books.SalePrice
    FROM books
    JOIN authors ON books.AuthorID = authors.AuthorID
    JOIN genres ON books.GenreID = genres.GenreID
    JOIN publishers ON books.PublisherID = publishers.PublisherID
    WHERE books.Title LIKE %s;


    """, ('%' + search_query + '%',))
    print("hh")
    books = cursor.fetchall()
    lid.append(books[0][0])
    cursor.close()
    
    # Store books in session for retrieval on the next page
    session['books'] = [dict(id=book[0], title=book[1], author=book[2],AuthorRating=book[3], GenreName=book[4], PublisherName=book[5], PublishingYear=book[6], AverageRating=book[7],SalesRank=book[8],SalePrice=book[9]) for book in books]  # Adjust as per your database schema
    print(type(books))
    return redirect(url_for('display'))

@app.route('/display')
def display():
    # Retrieve books from session
    books = session.get('books', [])
    return render_template('display.html', books=books)

@app.route('/checkout')
def checkout():
    if 'logged_in' not in session or not session['logged_in']:
        return redirect(url_for('login'))
    else:
        return render_template('checkout.html', user=session['user'])

@app.route('/perform_checkout', methods=['POST'])
def perform_checkout():
    book_id = lid.pop(-1)
    print(book_id)
    quantity = int(request.form['quantity'])

    cursor = mysql.connection.cursor()
    
    # Begin a transaction
    cursor.execute("START TRANSACTION")
    
    try:
        # Fetch the sale price from the books table
        price_query = "SELECT SalePrice, units,BookID FROM books WHERE BookID = %s"
        print(price_query)
        cursor.execute(price_query, (book_id,))
        result = cursor.fetchone()
        salesprice = result[0]
        current_units = result[1]
        gross_sales = salesprice * quantity
        print(book_id)
        # Check if there are enough units available
        if current_units < quantity:
            raise Exception("Not enough units in stock")

        # Update the units in the books table
        new_units = current_units - quantity
        update_units_query = "UPDATE books SET units = %s WHERE BookID = %s"
        cursor.execute(update_units_query, (new_units, book_id))
        
        # Insert a new record into the transactions table including the GrossSales and UnitsSold
        insert_query = "INSERT INTO transactions (BookID, GrossSales, UnitsSold) VALUES (%s, %s, %s)"
        cursor.execute(insert_query, (book_id, gross_sales, quantity))

        # Commit the transaction
        mysql.connection.commit()
        
    except Exception as e:
        # If an error occurs, rollback any changes
        mysql.connection.rollback()
        return str(e), 400  # Return the error message and a 400 Bad Request status
    
    finally:
        cursor.close()

    return redirect(url_for('checkout_complete'))



@app.route('/checkout_complete')
def checkout_complete():
    return render_template('checkout_complete.html')

@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    session.pop('user', None)
    return redirect(url_for('login'))  # Redirect to login page on logout


if __name__ == '__main__':
    app.run(debug=True)
