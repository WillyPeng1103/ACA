def Extend_Euclide (a, b):
    if b == 0 :
        return (a, 1, 0) 
    else:
        (dd, xx, yy) = Extend_Euclide (b, (a % b))
    
    