// hello world dissassembled with monodis

.assembly extern mscorlib
{
  .ver 0:0:0:0
}
.assembly 'hello'
{
  .hash algorithm 0x00008004
  .ver  0:0:0:0
}
  .class private auto ansi beforefieldinit Hello
        extends [mscorlib]System.Object
  {

    // method line 1
    .method public hidebysig  specialname  rtspecialname
           instance default void .ctor()  cil managed
    {
        // Method begins at RVA 0x20ec
        // Code size 7 (0x7)
        .maxstack 8
        IL_0000: ldarg.0
        IL_0001: call instance void valuetype [corlib]System.Object::.ctor()
        IL_0006: ret
    } // end of method instance default void .ctor()

    // method line 2
    .method public static
           default void Main()  cil managed
    {
        // Method begins at RVA 0x20f4
        .entrypoint
        // Code size 11 (0xb)
        .maxstack 8
        IL_0000: ldstr "IL: Hello Mono World!"
        IL_0005: call void class [corlib]System.Console::WriteLine(string)
        IL_000a: ret
    } // end of method default void Main()

  } // end of type Hello
