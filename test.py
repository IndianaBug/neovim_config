import unittest


def add(a, b):
    return a + b


def subtract(a, b):
    return a - b


prsa


class TestMathOperations(unittest.TestCase):

    def test_add(self):
        "Hello."
        self.assertEqual(add(2, 3), 5)
        self.assertEqual(add(-1, 1), 0)
        self.assertEqual(add(0, 0), 0)

    def test_subtract(self):
        self.assertEqual(subtract(5, 3), 2)
        self.assertEqual(subtract(0, 4), -4)
        self.assertEqual(subtract(-3, -3), 0)


if __name__ == "__main__":
    unittest.main()


class test:

    @classmethod
    def hello(cls, inp: int) -> dict:
        return "hellp"


a = test.hello("s")
