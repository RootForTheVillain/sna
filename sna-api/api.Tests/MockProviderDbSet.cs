using System;
using api.Models;
using System.Linq;

namespace api.Tests
{
    public class MockProviderDbSet : MockDbSet<Provider>
    {
        public override Provider Find(params object[] keyValues)
        {
            return this.SingleOrDefault(p => p.ProviderId == (int)keyValues.Single());
        }
    }
}