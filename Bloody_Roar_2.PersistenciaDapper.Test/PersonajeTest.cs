using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;

namespace Bloody_Roar_2.PersistenciaDapper.Test;

public class PersonajeTest : TestBase
{
    public PersonajeTest() : base()
    {

    }
    [Fact]
    public void AltaPersonajeOK()
    {
        var yugo = new Personaje()
        {
            Nombre = "Yugo",
            NombreBestia = "Lobo",
            ResistenciaBestia = 10
        };

        Dao.AltaPersonaje(yugo);
    }
}