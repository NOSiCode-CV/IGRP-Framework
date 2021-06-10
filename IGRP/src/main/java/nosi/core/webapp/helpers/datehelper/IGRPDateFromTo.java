package nosi.core.webapp.helpers.datehelper;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;
import java.util.Optional;
import java.util.regex.Pattern;

import nosi.core.webapp.Core;

/**
 * william.fonseca 02/06/2021
 */
public class IGRPDateFromTo {

	private LocalDateTime from;
	private LocalDateTime to;
	private String dateFromTo;

	private static final String DATE_FROM_TO_PATTERN = "^([0-2][0-9]|(3)[0-1])(\\-)(((0)[0-9])|((1)[0-2]))(\\-)\\d{4}(\\ / )([0-2][0-9]|(3)[0-1])(\\-)(((0)[0-9])|((1)[0-2]))(\\-)\\d{4}$";

	private IGRPDateFromTo(String dateFromTo) {
		this.dateFromTo = dateFromTo;
		this.extractDates();
	}

	/**
	 * Obtains an instance of {@code IGRPDateFromTo} from a text string such as
	 * {@code 02-06-2021 / 30-06-2021}.
	 *
	 * @param dateFromTo the string representation from which the start and end
	 *                   dates are obtained, respectively.
	 * 
	 * @return {@code IGRPDateFromTo}, not null
	 */
	public static IGRPDateFromTo of(String dateFromTo) {
		return new IGRPDateFromTo(dateFromTo);
	}

	private void extractDates() {

		if (isDateFromToStringNotValid())
			return;

		final String[] range = this.dateFromTo.split(Core.Cons.DATE_SEPARATOR.getValue());
		final DateTimeFormatter formatter = DateTimeFormatter.ofPattern(Core.DD_MM_YYYY);

		this.from = LocalDate.parse(range[0], formatter).atStartOfDay();
		this.to = LocalDate.parse(range[1], formatter).atTime(LocalTime.MAX);
	}

	private boolean isDateFromToStringNotValid() {
		
		if (Objects.isNull(dateFromTo))
			return true;

		this.dateFromTo = dateFromTo.trim();

		if (this.dateFromTo.isBlank())
			return true;

		final Pattern pattern = Pattern.compile(DATE_FROM_TO_PATTERN);

		return !pattern.matcher(this.dateFromTo).matches();
	}

	/**
	 * This returns an {@link Optional} with the {@link LocalDateTime} object formed
	 * from the start date at midnight, 00:00, the start of this date time.
	 *
	 * @return {@link Optional} with the {@link LocalDateTime} object or an empty
	 *         {@link Optional} if the start date cannot be parsed.
	 */
	public Optional<LocalDateTime> from() {
		return Optional.ofNullable(this.from);
	}

	/**
	 * This returns an {@link Optional} with the {@link LocalDateTime} object at max
	 * time, the maximum supported {@link LocalTime}, '23:59:59.999999999'. This is
	 * the time just before midnight at the end of the day.
	 * 
	 * @return {@link Optional} with the {@link LocalDateTime} object or an empty
	 *         {@link Optional} if the end date cannot be parsed.
	 */
	public Optional<LocalDateTime> to() {
		return Optional.ofNullable(this.to);
	}

}
