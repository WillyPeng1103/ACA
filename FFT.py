from cmath import exp, pi
from typing import Type

def format_complex_output(values, precision=2):
    """ Format complex numbers to make them more readable by rounding small parts to zero and limiting precision.
    
    Args:
    values (list): A list of complex numbers.
    precision (int): Number of decimal places to round to.

    Returns:
    list: A list of formatted complex numbers.
    """
    formatted_values = []
    threshold = 10**(-precision)
    for value in values:
        real = round(value.real, precision)
        imag = round(value.imag, precision)
        # Set very small values to zero
        if abs(real) < threshold:
            real = 0
        if abs(imag) < threshold:
            imag = 0
        formatted_values.append(complex(real, imag))
    return formatted_values

# Example of how to use the function (commented out as per instructions)
# complex_numbers = [(-1+1.2246467991473532e-16j), (1.5 - 0.5j)]
# formatted_output = format_complex_output(complex_numbers)
# print(formatted_output)


def FFT (a):
    n = len(a)
    if n == 1:
        return a
    wn = exp(2j * pi / n)
    w = 1
    a_even = a[0::2]
    a_odd = a[1::2]
    y_even = FFT(a_even)
    y_odd = FFT(a_odd)
    y = n * [0]
    for k in range(n//2):
        # Butterfly Operation
        y[k] = y_even[k] + w * y_odd[k]
        y[k + n//2] = y_even[k] - w * y_odd[k]
        print (f"y_even[{k}] = {y_even[k]}")
        print (f"y_odd[{k}] = {y_odd[k]}")
        print (f"w = {format_complex_output([w])}")
        print (f"Add OP, y[{k}] = {y[k]}")
        print (f"Sub OP, y[{k + n//2}] = {y[k + n//2]}")
        print("----------------------------------------")
        w = wn * w
    return y

a = [0, 2, 3, -1, 4, 5, 7, 9]
result = FFT(a)
result = format_complex_output(result)
print (result)