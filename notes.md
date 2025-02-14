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
## Useful Commands
```
# Running the Django dev server
python manage.py runserver

# Running the functional tests
python functional_tests.py

# Running the unit tests
python manage.py test
```
