# Test-Driven Development with Python

This repository contains the practical examples from the book *Test-Driven Development with Python* by Harry J.W. Percival. It reflects the current state of the To-Do List application as I progress through the book. 

📌 **Repository under continuous update.**  

## 📖 About the Book  
The book *TDD with Python* teaches the Test-Driven Development (TDD) methodology using Python and Django. It covers everything from the fundamentals of automated testing to building a complete web application while applying best development practices.  

## 🛠️ Technologies Used
- **Django** - Web framework for application development  
- **Selenium** - Tool for automated functional testing  
- **Unittest** - Python's built-in testing framework  

## 📂 Project Structure
```
.
├── db.sqlite3
├── functional_tests
│   ├── __init__.py
│   ├── tests.py
├── lists
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── migrations
│   │   ├── 0001_initial.py
│   │   ├── 0002_item_text.py
│   │   └── __init__.py
│   ├── models.py
│   ├── static
│   │   └── bootstrap
|   │       ├── css
|   |       │   ├── bootstrap-grid.css
│   │       |   ├── [...]
│   │       |   └── bootstrap.rtl.min.css.map
|   │       └── js
|   |           ├── bootstrap.bundle.js
│   │           ├── [...]
│   │           └── bootstrap.min.js.map
│   ├── templates
│   │   ├── home.html
│   │   └── list.html
│   ├── tests.py
│   └── views.py
├── manage.py
└── superlists
    ├── __init__.py
    ├── asgi.py
    ├── settings.py
    ├── urls.py
    └── wsgi.py
```
