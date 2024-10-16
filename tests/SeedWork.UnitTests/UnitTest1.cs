namespace SeedWork.UnitTests;

using SeedWork;
using Xunit;

public class UnitTest1
{
    [Fact]
    public void Test1()
    {
        var message = Class1.Message();

        Assert.Equal("Hello from SeedWork!", message);
    }
}
