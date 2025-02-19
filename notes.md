# 📌 Notes

## Functional Test

- **Functional Test** = **Acceptance Test** = **End-to-End Test**  
- Also known as **black box test** or **closed box test** because the test doesn't have knowledge of the internal workings of the system under test.
- It involves looking at how the application functions as a whole, from the user’s perspective.

### Useful Concepts

**User Story:**  
   - A description of how the application will work from the user’s point of view.
   - Used to structure the functional test.

**Expected Failure:**  
   - When a test fails in the way we expect it to.
   - This can be useful for testing failure scenarios and ensuring the application handles them correctly.

**Unexpected failure**<br>
When a test fails in a way we weren’t expecting. This either means that we’ve made a mistake in our tests, or that the tests have helped us find a regression, and we need to fix something in our code.

**Regression**<br>
When a change unexpectedly breaks some aspect of the application which used to work.

**Triangulation**<br>
Adding a test case with a new specific example for some existing code, to justify generalising the implementation (which may be a "cheat" until that point).

**Three strikes and refactor**<br>
A rule of thumb for when to remove duplication from code. When two pieces of code look very similar, it often pays to wait until you see a third use case, so that you’re more sure about what part of the code really is the common, re-usable part to refactor out.

**Migrations**<br>
In Django, are files that track database schema changes (such as creating tables, modifying fields, or deleting columns) in a version-controlled and automated way. Without migrations, we would have to manuallymodify the database whenever models change, which is error-prone and hard to maintain.

## Functional Tests vs Unit Tests

| Functional Tests | Unit Tests |
|------------------|------------|
| Test from the user's point of view | Test the application from inside, from the programmer's point of view |
| One test per feature/User Story | Many tests per feature |
| Can test that the UI "really" works | Test the internals, individual functions or classes |
| Provides confidence that everything is wired together correctly, works end-to-end | Can exhaustively check permutaions, details, edge cases |

## TDD approach used in the book
1. We start by writing a functional test, describing a typical example of our new functionality from the user’s point of view.
2. Once we have a functional test that fails, we start to think about how to write code that can get it to pass (or at least to get past its current failure). We now use one or more unit tests to define how we want our code to behave—​the idea is that each line of production code we write should be tested by (at least) one of our unit tests.
3. Once we have a failing unit test, we write the smallest amount of application code we can, just enough to get the unit test to pass. We may iterate between steps 2 and 3 a few times, until we think the functional test will get a little further.
4. Now we can rerun our functional tests and see if they pass, or get a little further. That may prompt us to write some new unit tests, and some new code, and so on.
5. Once we’re comfortable that the core functionality works end-to-end, we can extend out to cover more permutations and edge cases, using just unit tests now.

## Unit Test/Code Cycle
1. Create an unit test with the expected behaviour for a function/piece of code
2. Run the unit test and see how it fail
3. Make a minimal code change to address the current test failure
4. Repeat

## Django's MVC
Django is broadly structured along a classic Movel-View-Controller pattern. But its:
- Models -> behaves as Models
- Views -> behaves as Controllers
- Templates -> behaves as Views

As any web server, Django's main job is to decide what to do when a user asks for a particular URL on our site.

```


             Send an HTTP request   |------------|   Call the View       |---------------|
|--------| -----------------------> |   Django   | ------------------->  |     View      |
|  User  |  for a particular URL    |------------|                       |---------------|
|--------|    <---------------      Uses some rules     <---------------  Return the response
            Return the response     to decide which
                                    view function 
                                    should deal with
                                    the request 
                                    (resolve the URL)

```

## The TDD process 

### Red, Green, Refactor
1. We write a test, and see it fail ("Red)
2. We cycle between code and tests until the test passes ("Green")
3. Then, we look for opportunities to refactor
4. Repeat as required


### Including the unit test/code cycle

```
                              Unit test/code cycle
                           |-----------------------| 
                           | |-------------------| |
            |------------> | |   Run the test.   | |-- yes (GREEN) -|
            |              | |   Does it pass?   | |                |
|---------------|          | |-------------------| |                v
|  Write a test |          |      |         ^      |        |--------------|
|---------------|          |   no (RED)     |      |        | Does it need |
         ^                 |      |         |      |        | refactoring? |
         |                 |      v         |      |        |--------------|
         |                 | |-------------------| |             |     |
         |                 | |     Write/fix     | |<--- yes ----|     |
         |                 | |    minimal code   | |                   |
         |                 | |-------------------| |                   |
         |                 |-----------------------|                   |
         |                                                             |
         |------------------------------------------------ no ---------| 



```

### Double-loop TDD

```
                                                     
                             |-------------------|  
                  |------->  |        RED        |  ---------------|
                  |          |    (failing FT)   |                 v
                  |          |-------------------|              |-------|
      write a new |                                         |-> |  RED  |--------------|
  functional test |             functional tests            |   |-------|              v
(FT) for the next |                  loop                   |                      |-------|
     feature      |                                         |           unit       | GREEN |
                  |          |--------------------|     |----------|    tests      |-------|
                  |          |      GREEN         |     | refactor |     loop          |
                  |----------| FT passes, feature |     |----------|<------------------|
                             |     is complete    |                     
                             |--------------------|                        |
                                       ^                                   |
                                       |-----------------------------------|



```

## TDD Philosophy
- Working State to Working State: Take one step at time, and go from working state to working state
- Split work out into small, achievable tasks
- YAGNI: You ain't gonna need it! Avoid the temptation to write code that you **think** *might* be useful, just because it suggests itself at the time. Chances are, you won’t use it, or you won’t have anticipated your future requirements correctly

## Useful Commands
```
# Running the Django dev server
python manage.py runserver

# Running the functional tests
python manage.py test functional_tests

# Running the unit tests
python manage.py test lists

# Run all the tests
python manage.py test

# Generating migration files based on changes made to Django models (models.py)
python manage.py makemigrations

# Applying pending migrations to the database, keeping the schema up to date
python manage.py migrate

# Deleting the SQLite database; recreating database tables by applying all migrations
rm db.sqlite3
python manage.py migrate --noinput
```

## Testing Best Practices
- **Ensure test isolation**: Different tests shouldn't affect one another, i.e. we need to reset any permanent state at the end of each test.
- **Avoid voodoo sleeps**: The length of time we wait is always a bot of a shot in the dark. Either too short and vulnerable to spurious failures, or too long and it'll slow down our test runs. Prefer a retry loop that polls our app and moves on as soon as possible.
- **Don't rely on Selenium's implicit waits**: The implementation of the implicit waits varies between browsers, and is not always reliable. Remember: "Explict is better than implicit".
