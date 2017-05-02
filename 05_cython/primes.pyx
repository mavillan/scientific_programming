#!python
#cython: cdivision=True 
#cython: boundscheck=False
#cython: nonecheck=False
#cython: wraparound=False

def primes_cython3(int n):
    # Note the type declarations below
    cdef list primes = [False, False] + [True] * (n - 2)
    cdef int i = 2
    cdef int k = 0
    # The rest of the functions is unchanged
    while i < n:
        # We do not deal with composite numbers.
        if not primes[i]:
            i += 1
            continue 
        k= i+i
        # We mark multiples of i as composite numbers.
        while k < n:
            primes[k] = False
            k += i 
        i += 1
    # We return all numbers marked with True.
    return [i for i in range(2, n) if primes[i]]