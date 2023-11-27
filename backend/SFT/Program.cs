class Program
{
    private static void Main(string[] args)
    {
        Console.WriteLine("Автор: Костянтин Бондаренко, Група: ПЗПI-21-3");

        double a, angleB, angleC;

        if (args.Length == 3)
        {
            a = double.Parse(args[0]);
            angleB = double.Parse(args[1]);
            angleC = double.Parse(args[2]);
        }
        else
        {
            Console.Write("Введiть довжину сторони трикутника: ");
            while (!double.TryParse(Console.ReadLine(), out a))
            {
                Console.WriteLine("Невалiдний iнпут");
                Console.Write("Введiть довжину сторони трикутника: ");
            }

            Console.Write("Введiть величину прилеглого кута в градусах: ");
            while (!double.TryParse(Console.ReadLine(), out angleB))
            {
                Console.WriteLine("Невалiдний iнпут");
                Console.Write("Введiть величину прилеглого кута в градусах: ");
            }

            Console.Write("Введiть величину прилеглого кута в градусах: ");
            while (!double.TryParse(Console.ReadLine(), out angleC))
            {
                Console.WriteLine("Невалiдний iнпут");
                Console.Write("Введiть величину прилеглого кута в градусах: ");
            }
        }

        Console.WriteLine($"Текст завдання: {a}, {angleB}, {angleC}.");
        
        var isTriangle = IsTriangleValid(a, angleB, angleC);

        if (isTriangle)
        {
            var triangleType = DetermineTriangleType(a, angleB, angleC);
            Console.WriteLine($"Тип трикутника: {triangleType}");
        }
        else
        {
            Console.WriteLine("Це не трикутник");
        }
    }

    private static bool IsTriangleValid(double a, double angleB, double angleC)
    {
        var angleA = 180 - angleB - angleC;
        return a > 0 && angleB is > 0 and < 180 && angleA is > 0 and < 180 && angleC is > 0 and < 180;
    }

    private static string DetermineTriangleType(double a, double angleB, double angleC)
    {
        var angleA = 180 - angleB - angleC;
        var radA = Math.PI * (angleA / 180);
        var radB = Math.PI * (angleB / 180);
        var radC = Math.PI * (angleC / 180);
        var b = a / Math.Sin(radA) * Math.Sin(radB);
        var c = a / Math.Sin(radA) * Math.Sin(radC);

        if (a == b && b == c)
        {
            return "рiвностороннiй";
        }

        if (angleA == 90 || angleB == 90 || angleC == 90)
        {
            return "прямокутний";
        }

        if (a == b || a == c || b == c)
        {
            return "рiвнобедренний";
        }

        return "неправильний";
    }
}