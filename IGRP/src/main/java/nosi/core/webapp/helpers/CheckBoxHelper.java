package nosi.core.webapp.helpers;

import java.util.ArrayList;
import java.util.List;

import nosi.core.gui.fields.Field;
import nosi.core.webapp.Core;

/**
 * Emanuel 5 Feb 2019
 */

public class CheckBoxHelper {

	private final List<String> chekedIds;
	private final List<String> uncheckedIds;

	private CheckBoxHelper(String[] allValues, String[] checkedValues) {
		this.chekedIds = new ArrayList<>();
		this.uncheckedIds = new ArrayList<>();
		this.extract(allValues, checkedValues);
	}

	public static CheckBoxHelper of(String[] allValues, String[] checkedValues) {
		return new CheckBoxHelper(allValues, checkedValues);
	}

	public static CheckBoxHelper of(Field field) {
		final String[] allValues = Core.getParamArray(field.getParamTag().concat("_fk"));
		final String[] checkedValues = Core.getParamArray(field.getParamTag().concat("_check_fk"));
		return CheckBoxHelper.of(allValues, checkedValues);
	}

	private void extract(String[] allValues, String[] checkedValues) {

		if (!Core.isArraySameSize(allValues, checkedValues))
			throw new IllegalArgumentException("The arrays provided are not the same...");

		for (int i = 0; i < allValues.length; i++) {
			if (allValues[i].compareTo(checkedValues[i]) == 0) {
				this.chekedIds.add(allValues[i]);
				continue;
			}
			this.uncheckedIds.add(allValues[i]);
		}
	}

	public List<String> getChekedIds() {
		return this.chekedIds;
	}

	public List<String> getUncheckedIds() {
		return this.uncheckedIds;
	}
}
