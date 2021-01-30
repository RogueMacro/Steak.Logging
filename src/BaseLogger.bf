using System;

namespace Steak.Logging
{
	public abstract class BaseLogger : ILogger
	{
		public readonly String Format = new .() ~ delete _;
		public readonly String Name = new .() ~ delete _;
		public LogLevel MinimumLevel;

		private bool mOwnsFormatter;
		private ILogFormatter mFormatter = null ~ if (mOwnsFormatter) delete _;

		public this (LogLevel level)
		{
			Name.Set("Log");
			MinimumLevel = .Info;
			mFormatter = new DefaultLogFormatter();
			mOwnsFormatter = true;
		}

		public this(LogLevel level, ILogFormatter formatter)
		{
			Name.Set("Log");
			MinimumLevel = .Info;
			mFormatter = formatter == null ? new DefaultLogFormatter() : formatter;
			mOwnsFormatter = formatter == null;
		}

		public this(StringView name, LogLevel level, ILogFormatter formatter)
		{
			Name.Set(name);
			MinimumLevel = level;
			mFormatter = formatter == null ? new DefaultLogFormatter() : formatter;
			mOwnsFormatter = formatter == null;
		}

		public this(StringView name, StringView format, LogLevel level, ILogFormatter formatter)
		{
			Name.Set(name);
			Format.Set(format);
			MinimumLevel = level;
			mFormatter = formatter == null ? new DefaultLogFormatter() : formatter;
			mOwnsFormatter = formatter == null;
		}

		public void SetFormatter(ILogFormatter formatter)
		{
			if (mOwnsFormatter)
				delete mFormatter;
			mOwnsFormatter = false;
			mFormatter = formatter;
		}

		public void SetFormatter<T>() where T : ILogFormatter, class, new
		{
			if (mOwnsFormatter)
				delete mFormatter;
			mOwnsFormatter = true;
			mFormatter = new T();
		}

		public void SetFormat(StringView format)
		{
			Format.Set(format);
		}

		public void ResetFormat()
		{
			Format.Clear();
		}

		public virtual void Log(LogLevel level, StringView format, params Object[] args)
		{
			if (level < MinimumLevel)
				return;

			String message = scope .();
			message.AppendF(format, params args);

			String formattedMessage = scope .();
			mFormatter.Format(this, level, Format.IsEmpty ? Log.DefaultFormat : Format, message, formattedMessage);

			Log(level.Color, formattedMessage);
		}

		protected abstract void Log(ConsoleColor color, StringView message);

		[Inline] public virtual void Trace(StringView format, params Object[] args) => Log(.Trace, format, params args);
		[Inline] public virtual void Info(StringView format, params Object[] args) => Log(.Info, format, params args);
		[Inline] public virtual void Warning(StringView format, params Object[] args) => Log(.Warning, format, params args);
		[Inline] public virtual void Error(StringView format, params Object[] args) => Log(.Error, format, params args);
		[Inline] public virtual void Success(StringView format, params Object[] args) => Log(.Success, format, params args);

		public void FatalErrorF(StringView format, params Object[] args)
		{
			var message = scope String()..AppendF(format, params args);
			Log(.Error, message);
			Runtime.FatalError(message);
		}

		public virtual void FatalError(String message, int CallerLineNum = Compiler.CallerLineNum, String CallerFilePath = Compiler.CallerFilePath)
		{
			Log(.Error, message);
			Runtime.FatalError(message, CallerFilePath, CallerLineNum);
		}
	}
}
