using System;

namespace Steak.Logging
{
	public class DefaultLogFormatter : ILogFormatter
	{
		public void Format(BaseLogger logger, LogLevel level, StringView format, StringView message, String output)
		{
			for (int i = 0; i < format.Length; ++i)
			{
				if (format[i] == '%' && i+1 < format.Length)
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
						output.Append(message);
						break;
					case 'l':
						output.AppendF("{}", level);
					default:
						i--;
					}

					i++;
				}
				else
				{
					output.Append(format[i]);
				}
			}
		}
	}
}
