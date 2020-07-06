using System;

namespace Steak.Logging
{
	public static class Formatting
	{
		public static String Format = "[%t] %n: %x";
		public static ConsoleColor TraceColor = .Gray;
		public static ConsoleColor InfoColor = .White;
		public static ConsoleColor WarningColor = .Yellow;
		public static ConsoleColor ErrorColor = .Red;
		public static ConsoleColor SuccessColor = .Green;

		public static void Format(ILogger logger, LogLevel level, String output, StringView str, params Object[] args)
		{
			StringView format = logger.UseCustomFormat ? logger.CustomFormat : Format;

			for (int i = 0; i < format.Length; ++i)
			{
				if (format[i] == '%' && i+1 < format.Length && format[i+1] != '%')
				{
					switch (format[i+1])
					{
					case 't':
						output.AppendF("{}:{}:{}", DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
						break;
					case 'h':
						output.AppendF("{}", DateTime.Now.Hour);
						break;
					case 'm':
						output.AppendF("{}", DateTime.Now.Minute);
						break;
					case 's':
						output.AppendF("{}", DateTime.Now.Second);
						break;
					case 'e':
						output.AppendF("{}", DateTime.Now.Millisecond);
						break;
					case 'y':
						output.AppendF("{}", DateTime.Now.Year);
						break;
					case 'o':
						output.AppendF("{}", DateTime.Now.Month);
						break;
					case 'd':
						output.AppendF("{}", DateTime.Now.DayOfWeek);
						break;
					case 'a':
						output.AppendF("{}", DateTime.Now.Day);
						break;
					case 'n':
						output.Append(logger.Name);
						break;
					case 'x':
						output.AppendF(str, params args);
						break;
					case 'l':
						output.AppendF("{}", level);
					default:
						--i;
					}

					++i;
				}
				else
				{
					output.Append(format[i]);
				}
			}
		}
	}
}
