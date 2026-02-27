import threading
import time
from datetime import timedelta

START_TIME = time.time()

def timestamp():
    elapsed = int(time.time() - START_TIME)
    return str(timedelta(seconds=elapsed))[2:7]

class Fork:
    def __init__(self, fork_id):
        self.id = fork_id
        self.lock = threading.Lock()

class Philosopher(threading.Thread):
    def __init__(self, pid, left_fork, right_fork, arbitrator):
        super().__init__()
        self.pid = pid
        self.left_fork = left_fork
        self.right_fork = right_fork
        self.arbitrator = arbitrator

    def log(self, message):
        print(f"[{timestamp()}] Philosopher {self.pid} {message}")

    def think(self):
        self.log("is Thinking.")
        time.sleep(1)

    def eat(self):
        self.log("is Eating.")
        time.sleep(1)

    def run(self):
        while True:
            self.think()

            # Request permission from arbitrator
            self.arbitrator.acquire()

            # Pick up forks
            self.left_fork.lock.acquire()
            self.log("picked up Left Fork.")

            self.right_fork.lock.acquire()
            self.log("picked up Right Fork.")

            self.eat()

            # Put down forks
            self.right_fork.lock.release()
            self.log("put down Right Fork.")

            self.left_fork.lock.release()
            self.log("put down Left Fork.")

            # Release arbitrator
            self.arbitrator.release()

def main():
    num_philosophers = 5

    forks = [Fork(i) for i in range(num_philosophers)]

    # Arbitrator allows only N-1 philosophers at the table
    arbitrator = threading.Semaphore(num_philosophers - 1)

    philosophers = []
    for i in range(num_philosophers):
        philosopher = Philosopher(
            pid=i + 1,
            left_fork=forks[i],
            right_fork=forks[(i + 1) % num_philosophers],
            arbitrator=arbitrator
        )
        philosophers.append(philosopher)

    for p in philosophers:
        p.start()

if __name__ == "__main__":
    main()