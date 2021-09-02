#!/usr/bin/env dotnet-script

#r "nuget: Bogus, 33.1.1"

using Bogus;
public class Person
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
}
var peopleGenerator = new Faker<Person>()
    .RuleFor(o => o.FirstName, f => f.Name.FirstName())
    .RuleFor(o => o.LastName, f => f.Name.LastName());

var person = peopleGenerator.Generate();
Console.WriteLine($"Hello, {person.FirstName} {person.LastName}");