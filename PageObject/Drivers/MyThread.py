# my_threading.py
import threading
import time

def task_1():
    print("Task 1 started")
    time.sleep(5)
    print("Task 1 finished")

def task_2():
    print("Task 2 started")
    time.sleep(5)
    print("Task 2 finished")

def run_in_threads():
    thread1 = threading.Thread(target=task_1)
    thread2 = threading.Thread(target=task_2)

    thread1.start()
    thread2.start()

    thread1.join()
    thread2.join()

if __name__ == "__main__":
    run_in_threads()
