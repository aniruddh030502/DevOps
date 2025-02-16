import unittest
from addfunc import add

class TestMathOperations(unittest.TestCase):
    def test_add(self):
        """Test addition of two numbers."""
        self.assertEqual(add(2, 3), 5)
        self.assertEqual(add(-1, 1), 0)
        self.assertEqual(add(0, 0), 0)
        self.assertEqual(add(5.5, 4.5), 10.0)

if __name__ == "__main__":
    unittest.main()
