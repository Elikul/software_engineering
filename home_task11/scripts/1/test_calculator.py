import sys
import os

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

import calculator
import pytest

def test_add():
    assert calculator.add(2, 3) == 5
    assert calculator.add(-1, 1) == 0  
    assert calculator.add(-1, -1) == -2
    
def test_subtract():
    assert calculator.subtract(10, 5) == 5
    assert calculator.subtract(-1, -1) == 0
    assert calculator.subtract(-1, 1) == -2
    
def test_multiply():
    assert calculator.multiply(3, 4) == 12
    assert calculator.multiply(-1, 1) == -1
    assert calculator.multiply(0, 10) == 0 
    
def test_divide():
    assert calculator.divide(10, 2) == 5
    assert calculator.divide(-4, 2) == -2
    assert calculator.divide(5, 2) == 2.5
    
def test_divide_by_zero():
    with pytest.raises(ValueError) as exc_info:
        calculator.divide(10, 0)
    assert str(exc_info.value) == "Cannot divide by zero"


