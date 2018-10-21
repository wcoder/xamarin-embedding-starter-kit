//
// Utils.cs
// Copyright (c) 2018 Yauheni Pakala
//
namespace DotNet.SharedLibrary
{
    public static class Utils
    {
        /// <summary>
        /// Fibonacci Sequence
        /// </summary>
        /// <returns>Result of calculation.</returns>
        /// <param name="n">N steps.</param>
        public static int Fib(int n) => n > 1 ? Fib(n - 1) + Fib(n - 2) : n;
    }
}
