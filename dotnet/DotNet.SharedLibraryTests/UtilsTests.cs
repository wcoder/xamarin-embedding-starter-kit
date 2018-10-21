//
// UtilsTests.cs
// Copyright (c) 2018 Yauheni Pakala
//
using DotNet.SharedLibrary;
using Xunit;

namespace DotNet.SharedLibraryTests
{
    public class UtilsTests
    {
        [Theory]
        [InlineData(0, 0)]
        [InlineData(1, 1)]
        [InlineData(2, 1)]
        [InlineData(5, 5)]
        [InlineData(14, 377)]
        public void Fib(int n, int expected)
        {
            var result = Utils.Fib(n);

            Assert.Equal(expected, result);
        }
    }
}
